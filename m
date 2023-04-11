Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EF6DE010
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Apr 2023 17:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06110E24B;
	Tue, 11 Apr 2023 15:54:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385B10E37F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681228462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZNXveaGk5HLYRGMQ5DuVUz0xA+shHaKeZZfqAaQ1fA=;
 b=BNhSoKSX4kt0GfPp04g7QEZ3atp4QmXRRd7O7SMNnkfQxd7pfbW5D6us3kpyERkRsc7w09
 EUZNbp/yWi26eVFipBrdW3rsOX8CijjDeMNplrStBpd2oq1OiOoUEF5OGDDs9uLRA4fhd6
 ajX5CcD6bbAE3Uuzxm89xM7+0i1E/Sk=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-UZfDwwK1PmWzpkPu0RIbCA-1; Tue, 11 Apr 2023 11:54:21 -0400
X-MC-Unique: UZfDwwK1PmWzpkPu0RIbCA-1
Received: by mail-il1-f197.google.com with SMTP id
 b9-20020a923409000000b00326156e3a8bso690308ila.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Apr 2023 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228460; x=1683820460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZNXveaGk5HLYRGMQ5DuVUz0xA+shHaKeZZfqAaQ1fA=;
 b=wTs7L64+fQEvkXV1KDgNCsz6h8gnnuW5KX9fCL4uQbBUXHxQJhXZxCmeIIr+ELLfZT
 8tCU4hWeZXTX2yBmXf2DruRz+RJS+/M1GhMJPC4fEe36ILbDEi00O55W1gQ77LR1Kzkm
 jDoKSs0VoJfH+SqpdHsQponVYNNp9L4QDjvvJEvUcIP72wDPZF713BCRVfUETEqTi2xG
 /vfHlagNfKkvfQXQYU+dZIZNso6xX75WqLOgfOPDty43Uf45kQaksLYhrTnVzWkMj1rP
 jVCCtt6zIgloysDttw+8pB4nZvXQyz7Qt8XvSbPN4eYUih6NUMRCsdfCQlCeSuo1P0Gb
 rStA==
X-Gm-Message-State: AAQBX9fD5NG5kSycMrS0O8altMBuGtk9NT1sAJ/Un/jNlDC/SOTBUffG
 4fl8DmsbO7xxC7PkFfya3dgIPANXNitpBhfkFaRFtuPJXnrPziURa6n9U9jIsyfWW95mye1WfUF
 jyxJPK34BqhtiGgS48ykc8zPWYWUp41ieEg==
X-Received: by 2002:a5d:8049:0:b0:755:7b0c:6042 with SMTP id
 b9-20020a5d8049000000b007557b0c6042mr7337146ior.2.1681228460146; 
 Tue, 11 Apr 2023 08:54:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350bepyJTwaOkf+4bun1jkCJ259CNjNpHAeiIFiEnDDgFrMXPzn9WkVq9ZUWW34H3c+QFW6tIYQ==
X-Received: by 2002:a5d:8049:0:b0:755:7b0c:6042 with SMTP id
 b9-20020a5d8049000000b007557b0c6042mr7337124ior.2.1681228459808; 
 Tue, 11 Apr 2023 08:54:19 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 r17-20020a056638131100b003eb3be5601csm4105422jad.174.2023.04.11.08.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:54:18 -0700 (PDT)
Date: Tue, 11 Apr 2023 09:54:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 12/12] vfio/pci: Report dev_id in
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO
Message-ID: <20230411095417.240bac39.alex.williamson@redhat.com>
In-Reply-To: <ZDVfqpOCnImKr//m@nvidia.com>
References: <20230405102545.41a61424.alex.williamson@redhat.com>
 <ZC2jsQuWiMYM6JZb@nvidia.com>
 <20230405105215.428fa9f5.alex.williamson@redhat.com>
 <ZC2un1LaTUR1OrrJ@nvidia.com>
 <20230405125621.4627ca19.alex.williamson@redhat.com>
 <ZC3KJUxJa0O0M+9O@nvidia.com>
 <20230405134945.29e967be.alex.williamson@redhat.com>
 <ZC4CwH2ouTfZ9DNN@nvidia.com>
 <DS0PR11MB75292DA91ED15AE94A85EB3DC3919@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230406115347.7af28448.alex.williamson@redhat.com>
 <ZDVfqpOCnImKr//m@nvidia.com>
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
Cc: Yanting@freedesktop.org,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"  <lulu@redhat.com>, "@freedesktop.org,
	suravee.suthikulpanit@amd.com,
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
	"Liu,  Yi L" <yi.l.liu@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>, Yan@freedesktop.org,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"     <intel-gvt-dev@lists.freedesktop.org>,  "@freedesktop.org,
	intel-gfx@lists.freedesktop.org, <linux-s390@vger.kernel.org>, ,
	"Tian,  Kevin" <kevin.tian@intel.com>, Xudong@freedesktop.org,
	Zhenzhong@freedesktop.org,
	"  <suravee.suthikulpanit@amd.com>, "@freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,,
	" <intel-gfx@lists.freedesktop.org>,   "@freedesktop.org,
	linux-s390@vger.kernel.org, Terrence@freedesktop.org,
	"yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"shameerali.kolothum.thodi@huawei.com\"          <shameerali.kolothum.thodi@huawei.com>, "@freedesktop.org,
	lulu@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 11 Apr 2023 10:24:58 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Apr 06, 2023 at 11:53:47AM -0600, Alex Williamson wrote:
> 
> > Where whether a device is opened is subject to change outside of the
> > user's control.  This essentially allows the user to perform hot-resets
> > of devices outside of their ownership so long as the device is not
> > used elsewhere, versus the current requirement that the user own all the
> > affected groups, which implies device ownership.  It's not been
> > justified why this feature needs to exist, imo.  
> 
> The cdev API doesn't have the notion that owning a group means you
> "own" some collection of devices. It still happens as a side effect,
> but it isn't obviously part of the API. I'm really loath to
> re-introduce that group-based concept just for this. We are trying
> reduce the group API surface.
> 
> How about a different direction.
> 
> We add a new uAPI for cdev mode that is "take ownership of the reset
> group". Maybe it can be a flag in during bind.
> 
> When requested vfio will ensure that every device in the reset group
> is only bound to this iommufd_ctx or left closed. Now and in the
> future. Since no-iommu has no iommufd_ctx this means we can open only
> one device in the reset group.
> 
> With this flag RESET is guaranteed to always work by definition.
> 
> We continue with the zero-length FD, but we can just replace the
> security checks with a check if we are in reset group ownership mode.
> 
> _INFO is unchanged.
> 
> We decide if we add a new IOCTL to return the BDF so the existing
> _INFO can get back to the dev_id or a new IOCTL that returns the
> dev_id list of the reset group.
> 
> Userspace is required to figure out the extent of the reset, but we
> don't require that userspace prove to the kernel it did this when
> requesting the reset.

Take for example a multi-function PCIe device with ACS isolation between
functions, are you going to allow a user who has only been granted
ownership of a subset of functions control of the entire dev_set?  It
seems this proposal essentially extends the ownership model to the
greater of the dev_set or iommu group, apparently neither of which are
explicitly exposed to the user in the cdev API.  How does a user
determine when devices cannot be used independently in the cdev API?
Thanks,

Alex

