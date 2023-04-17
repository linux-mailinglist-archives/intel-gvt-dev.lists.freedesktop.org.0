Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BF6E515C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 17 Apr 2023 22:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666310E45B;
	Mon, 17 Apr 2023 20:06:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FFF10E357
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Apr 2023 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681762007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJkreuNWxZEE44fygt5zWJA+zq6jhPLH5gKQqPjNWJQ=;
 b=Xla5ZkPsZPKIc6iceJ5yI579cJ/vPfYTS7feRDTt2FNYgmE4F92GfPV67YucZXjE0ao60z
 YQWmSaq2o/1TLchHDaHrCtzESaygjqpQus7Q4aCnzWAfVklcdGrq6vHu6AqCkRmncK5/w5
 muYxHPeYsrCiyXMKxzMFWqJ6EQ0Jbjk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-IR3p9Uw8OGC8kB5xAOZpPw-1; Mon, 17 Apr 2023 16:06:46 -0400
X-MC-Unique: IR3p9Uw8OGC8kB5xAOZpPw-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-329326caa4aso15111885ab.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Apr 2023 13:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762005; x=1684354005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJkreuNWxZEE44fygt5zWJA+zq6jhPLH5gKQqPjNWJQ=;
 b=NtZakg5aqdRWd9QjnnGIE0Q6cHNRjKPsVsn27hRtQkbKswFSUV6glBnAJzhp6JdGcP
 qFKE6JYqHv4pB8lipVw2xQMkkNu94xENReCT1kb4PDtSYaC1ImNkmvrrTefg/TxSxd3C
 XHKaoZVGhtcloLQtwc6KV4A+W7dwD7Du0J4bG81Z8lFSY34XFg3PUWgk4T2iZkJM4pID
 id+wSeWOnjWg+2pNHW92wYc9uoI+UHtQWD4cOJ3dEGBCxU72uQtWwMMoN2zPwqLk4x14
 TGyqbSNkCPrTj90pxZtzvypwy40UloOL76jDlCtXwcgnEMMrVumI/3OSKiSTG2MRtg8c
 DM/w==
X-Gm-Message-State: AAQBX9dpg8Wes7jk7ol9ndz+v/Abe2/4NQcSayxh0X8xtajb5fBTVqa9
 KkOMZOkEH4kTHePpMaKYJj7Mv03HIQJZMOB8YJPYETElYQS5jQWphoKEGwl0YHbrEkvOVTjX85l
 tXToLHylYY7V0ZXgLx0qT8ZmMOdB1zBXRbQ==
X-Received: by 2002:a92:c9c3:0:b0:32a:ea4e:97d1 with SMTP id
 k3-20020a92c9c3000000b0032aea4e97d1mr5286297ilq.10.1681762005473; 
 Mon, 17 Apr 2023 13:06:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YnqbcCParzLbuNdjYNdpgBYhVf9e7CqwAl3G3qqrikIx+WLx6VM5MZjUBX5I9Y6yBJY1EJeg==
X-Received: by 2002:a92:c9c3:0:b0:32a:ea4e:97d1 with SMTP id
 k3-20020a92c9c3000000b0032aea4e97d1mr5286281ilq.10.1681762005206; 
 Mon, 17 Apr 2023 13:06:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k14-20020a056e02134e00b003291bea8c7fsm3361811ilr.81.2023.04.17.13.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:06:44 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:06:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230417140642.650fc165.alex.williamson@redhat.com>
In-Reply-To: <ZD2erN3nKbnyqei9@nvidia.com>
References: <20230412105045.79adc83d.alex.williamson@redhat.com>
 <ZDcPTTPlni/Mi6p3@nvidia.com>
 <BN9PR11MB5276782DA56670C8209470828C989@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZDfslVwqk6JtPpyD@nvidia.com>
 <20230413120712.3b9bf42d.alex.williamson@redhat.com>
 <BN9PR11MB5276A160CA699933B897C8C18C999@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529B7481AC97261E12AA116C3999@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230414111043.40c15dde.alex.williamson@redhat.com>
 <DS0PR11MB75290A78D6879EC2E31E21AEC39C9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230417130140.1b68082e.alex.williamson@redhat.com>
 <ZD2erN3nKbnyqei9@nvidia.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 17 Apr 2023 16:31:56 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Apr 17, 2023 at 01:01:40PM -0600, Alex Williamson wrote:
> > Yes, it's not trivial, but Jason is now proposing that we consider
> > mixing groups, cdevs, and multiple iommufd_ctxs as invalid.  I think
> > this means that regardless of which device calls INFO, there's only one
> > answer (assuming same set of devices opened, all cdev, all within same
> > iommufd_ctx).  Based on what I explained about my understanding of INFO2
> > and Jason agreed to, I think the output would be:
> > 
> > flags: NOT_RESETABLE | DEV_ID
> > {
> >   { valid devA-id,  devA-BDF },
> >   { valid devC-id,  devC-BDF },
> >   { valid devD-id,  devD-BDF },
> >   { invalid dev-id, devE-BDF },
> > }
> > 
> > Here devB gets dropped because the kernel understands that devB is
> > unopened, affected, and owned.  It's therefore not a blocker for
> > hot-reset.  
> 
> I don't think we want to drop anything because it makes the API
> ill suited for the debugging purpose.
> 
> devb should be returned with an invalid dev_id if I understand your
> example. Maybe it should return with -1 as the dev_id instead of 0, to
> make the debugging a bit better.
> 
> Userspace should look at only NOT_RESETTABLE to determine if it
> proceeds or not, and it should use the valid dev_id list to iterate
> over the devices it has open to do the config stuff.

If an affected device is owned, not opened, and not interfering with
the reset, what is it adding to the API to report it for debugging
purposes?  I'm afraid this leads into expanding "invalid dev-id" into an
errno or bitmap of error conditions that the user needs to parse.

> > OTOH, devE is unopened, affected, and un-owned, and we
> > previously agreed against the opportunistic un-opened/un-owned loophole.  
> 
> NOT_RESETABLE should be returned in this case, yes.
> 
> If we want to enable userspace to use the loophole it should be an
> additional flag. RESETABLE_FOR_NOW or something

Ugh, please no.  It's always a volatile result, but a volatile result
that relies on device state outside the scope or control of the user is
not even worthwhile imo.  Thanks,

Alex

