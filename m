Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422B6981CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Feb 2023 18:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BE010E293;
	Wed, 15 Feb 2023 17:19:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A70610E290
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Feb 2023 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676481580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8VA1c6iZtz7FGtZvF7i96siVIEbaGum/570KUL8JYQ=;
 b=KtQVuKnUT+LIaRXlAVYXQiTg8d1+gTwOmKShCYyzRBkRDXhfThXy5XMM3UcIXljQ5xd7rT
 M4be9Hwnpkm2I+gP3rAKSSm1MJgE5OvLZemA++6ByE3KFQjVaYOnarsBFAzNuBcjNKQqOz
 hdbQcofEc6bTmd0V8RJJo/3uoufQWIg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-bGKNwP9YOIqOGd8vB77ssA-1; Wed, 15 Feb 2023 12:19:39 -0500
X-MC-Unique: bGKNwP9YOIqOGd8vB77ssA-1
Received: by mail-io1-f70.google.com with SMTP id
 d73-20020a6bb44c000000b0072805fbd06aso12422669iof.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Feb 2023 09:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8VA1c6iZtz7FGtZvF7i96siVIEbaGum/570KUL8JYQ=;
 b=xfiGJNFZ1igpOK3aF9UBNBlcuIyX6AURTp6FW+5Pj3b/dthbWAHXk6CaH2mfqpwUcj
 gpFAXUPlOuBJXSMbz257tB4m84QEH+xJpyqnQt3HppqOcPfE/+ahEDodtp/HHsewbt/m
 76Oa6f4K6//B3SAT+v5NO2nVWF54BBs3jmZc+Sm/qou67o4JY1akBHm3JVBfYR2KGhCx
 nVwIfh44kQsLSjRGAN+rS8MhZBSvQP+igBW3Jmi9N/D0kkos4qR8iJFSVJV/VY9L1aLP
 0nxNtzSWU77dBH6BAbWoxvDW81KO45mt7Oi2qGQoFOyUA5ls7ILcHAiNOrSvH18Eiuzp
 qlnA==
X-Gm-Message-State: AO0yUKX+M1eTctqnjSg4zwHWGNMkPYSNEFHdRRlNMXpKvx3Hu9MVYWCM
 DvlJu6J/Z0F5jjDLy9VFkyyEHipbESpLB2KjHWm2BmdmSFosjnGaPXH94B11PhuUWku3nfPh96w
 hq5vt8bItogQSlB3DPkTBeXX2JdMSMaG2wg==
X-Received: by 2002:a92:c264:0:b0:314:5aa:94ba with SMTP id
 h4-20020a92c264000000b0031405aa94bamr3025119ild.9.1676481578288; 
 Wed, 15 Feb 2023 09:19:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8JFQMg3wd2K4N1A/L6AEEoJSZuErtZEgPbOjbAIunGxdN2sZ5/fVleX+GPj5DIkwZFSCFuTg==
X-Received: by 2002:a92:c264:0:b0:314:5aa:94ba with SMTP id
 h4-20020a92c264000000b0031405aa94bamr3025097ild.9.1676481577996; 
 Wed, 15 Feb 2023 09:19:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q6-20020a02c8c6000000b00374fa5b600csm5932699jao.0.2023.02.15.09.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:19:37 -0800 (PST)
Date: Wed, 15 Feb 2023 10:19:35 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 03/15] vfio: Accept vfio device file in the driver
 facing kAPI
Message-ID: <20230215101935.6416b39c.alex.williamson@redhat.com>
In-Reply-To: <Y+0QjaIWr84eVzsp@nvidia.com>
References: <20230213151348.56451-1-yi.l.liu@intel.com>
 <20230213151348.56451-4-yi.l.liu@intel.com>
 <Y+rLKvCMivND0izd@nvidia.com>
 <DS0PR11MB7529B43C7D357D8A0C2438C7C3A29@DS0PR11MB7529.namprd11.prod.outlook.com>
 <Y+zSRklKkL3rc2FB@nvidia.com>
 <DS0PR11MB75299F5D92AAC33FD8690694C3A39@DS0PR11MB7529.namprd11.prod.outlook.com>
 <Y+zwSn63eA7HrefO@nvidia.com>
 <20230215083234.194d07a9.alex.williamson@redhat.com>
 <Y+0QjaIWr84eVzsp@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 15 Feb 2023 13:04:13 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Feb 15, 2023 at 08:32:34AM -0700, Alex Williamson wrote:
> 
> > We've discussed this with Paolo before and I believe the bar of proof
> > is not very high.  I suspect it's not a problem that the device itself
> > is not yet accessible, so long as the user can prove they have the
> > ability to access the device, such as access to a restricted file.  In
> > most cases this isn't going to turn on wbinvd anyway since DMA will be
> > coherent.  Thanks,  
> 
> Isn't that a second problem, we don't know if the device is coherent
> until it is bound?

I think this is already accounted for in the conversion to device level
IOMMU ops, ie. device_iommu_capable() follows the
dev->iommu->iommu_dev->ops, where for example intel_iommu_capable() is
only looking at the capabilities of the IOMMU managing the device.  We
did some hand waving simplifications that was sufficient at some point,
IIRC.  Thanks,

Alex

